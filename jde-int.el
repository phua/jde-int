;;; jde-int.el --- Import JDEE projects from Eclipse.

;; Author: Peter Hua
;; Version: $Revision: 1.0$
;; Keywords: java jdee eclipse

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Import JDEE projects from Eclipse.

;; Usage:
;;   M-x jde-int-find-and-import-projects "/path/to/workspace"

;;; Code:

(require 'cl)
(require 'find-lisp)
(require 'xml)

(defun jde-int-sourcepath-entry-p (kind)
  (string= kind "src"))

(defun jde-int-classpath-entry-p (kind)
  (or (string= kind "output") (string= kind "lib")))

(defun jde-int-projectpath-entry-p (kind path)
  (and (string= kind "src") (= (string-to-char path) (string-to-char "/"))))

(defun jde-int-absolute-path (project-file-path path)
  (if (file-name-absolute-p path)
      path
    (concat project-file-path path)))

(defun jde-int-relative-path (file path)
  (let ((filepath (file-relative-name (expand-file-name file) path)))
    (if (string= (substring filepath 0 1) ".")
        filepath
      (concat "./" filepath))))

(defun jde-int-relative-paths (files path)
  (mapcar #'(lambda (file) (jde-int-relative-path file path)) files))

(defun jde-int-parse-classpath-file (classpath-file)
  (when (file-exists-p classpath-file)
    (let ((sourcepath nil)
          (global-classpath nil)
          (projectpath nil)
          (description (gethash project-name projects))
          (classpath (car (xml-parse-file classpath-file))))
      (mapc #'(lambda (classpathentry)
                (let* ((attrs (xml-node-attributes classpathentry))
                       (kind (cdr (assq 'kind attrs)))
                       (path (cdr (assq 'path attrs))))
                  (cond ((jde-int-projectpath-entry-p kind path)
                         (add-to-list 'projectpath (substring path 1)))
                        ((jde-int-sourcepath-entry-p kind)
                         (add-to-list 'sourcepath (jde-int-absolute-path project-file-path path)))
                        ((jde-int-classpath-entry-p kind)
                         (add-to-list 'global-classpath (jde-int-absolute-path project-file-path path))))))
            (xml-get-children classpath 'classpathentry))
      (puthash 'sourcepath sourcepath description)
      (puthash 'global-classpath global-classpath description)
      (puthash 'projectpath projectpath description))))

(defun jde-int-parse-project-file (project-file)
  (when (file-exists-p project-file)
    (let* ((project-description (car (xml-parse-file project-file)))
           (name (car (xml-get-children project-description 'name)))
           (text (car (xml-node-children name))))
      (puthash text (make-hash-table :size 4) projects)
      (puthash 'project-file-path project-file-path (gethash text projects))
      text)))

(defun jde-int-import-eclipse-projects ()
  (mapc #'(lambda (project-file)
            (let* ((project-file-path (file-name-directory project-file))
                   (project-name (jde-int-parse-project-file project-file)))
              (jde-int-parse-classpath-file (concat project-file-path ".classpath"))))
        (find-lisp-find-files workspace "^.project$")))

(defun jde-int-resolve-project-path (project description)
  (mapc #'(lambda (path)
            (puthash 'sourcepath
                     (union (gethash 'sourcepath description)
                            (gethash 'sourcepath (gethash path projects))
                            :test #'string=)
                     description)
            (puthash 'global-classpath
                     (union (gethash 'global-classpath description)
                            (gethash 'global-classpath (gethash path projects))
                            :test #'string=)
                     description))
        (gethash 'projectpath description)))

(defun jde-int-resolve-project-paths ()
  (maphash #'jde-int-resolve-project-path projects))

(defun jde-int-create-prj-file (project attrs)
  (with-temp-file (format "%sprj.el" (gethash 'project-file-path attrs))
    (insert "(jde-project-file-version \"1.0\")\n(jde-set-variables\n")
    (insert " '(jde-sourcepath\n   (quote ")
    (insert (prin1-to-string (jde-int-relative-paths (gethash 'sourcepath attrs) (gethash 'project-file-path attrs))))
    (insert "))\n '(jde-global-classpath\n   (quote ")
    (insert (prin1-to-string (jde-int-relative-paths (gethash 'global-classpath attrs) (gethash 'project-file-path attrs))))
    (insert ")))\n")))

(defun jde-int-export-jdee-projects ()
  (maphash #'jde-int-create-prj-file projects))

(defun jde-int-find-and-import-projects (workspace)
  "Import JDEE projects from Eclipse."
  (interactive "DWorkspace: " workspace)
  (let ((projects (make-hash-table :test #'equal)))
    (jde-int-import-eclipse-projects)
    (jde-int-resolve-project-paths)
    (jde-int-export-jdee-projects)))
