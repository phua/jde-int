(jdee-project-file-version "1.0")
(jdee-set-variables
 '(jdee-compile-option-directory "./target/classes")
 '(jdee-ant-args "-Dproject.name=Example -emacs")
 '(jdee-ant-buildfile "build.xml")
 '(jdee-ant-read-buildfile t)
 '(jdee-ant-read-target t)
 '(jdee-ant-interactive-buildfile "build.xml")
 '(jdee-run-working-directory ".")
 '(jdee-run-application-class "com.example.Main")
 ;; '(jdee-run-option-vm-args (quote ("-Djava.library.path=./lib")))
 '(jdee-run-option-application-args "./src/main/resources")
 '(jdee-db-option-vm-args jdee-run-option-vm-args)
 '(jdee-db-option-application-args jdee-run-option-application-args)
 '(jdee-junit-working-directory jdee-run-working-directory)

 '(jdee-sourcepath (quote ("./src/main/java" "./src/test/java")))
 '(jdee-global-classpath (quote ("./src/main/java" "./src/test/java" "./src/main/resources" "./target/classes" "/usr/share/java")))
 '(jdee-built-class-path (quote ("./target/classes")))

 '(jdee-xref-db-base-directory "./xrefdb")
 '(jdee-xref-store-prefixes (quote ("com.example")))
 '(jdee-xref-cache-size 3))

;; (defun flymake-java-ecj-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy 'jdee-ecj-create-temp-file))
;;          (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
;;     (list "java" (list "-jar" (concat local-load-path "/ecj-3.6.1.jar")
;;                        "-classpath" (jdee-build-classpath jdee-global-classpath) "-sourcepath" (jdee-build-classpath jdee-sourcepath)
;;                        "-d" "/dev/null" "-source" "1.5" "-target" "1.5" "-proceedOnError" "-Xemacs"
;;                        local-file))))

;; (defun jdee-int-generate-shell-command ()
;;   (interactive)
;;   (with-temp-file (concat jdee-compile-option-directory "/../execute.sh")
;;     (insert (format "$JAVA_HOME/bin/java -cp %s %s %s" (apply #'concat (mapcar #'(lambda (x) (concat x ":")) jdee-global-classpath))
;;          jdee-run-application-class
;;          jdee-run-option-application-args))))
