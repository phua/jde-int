(jde-project-file-version "1.0")
(jde-set-variables
 '(jde-compile-option-directory "./target/classes")
 '(jde-ant-args "-Dproject.name=Example -emacs")
 '(jde-run-working-directory ".")
 '(jde-run-application-class "com.example.Main")
 '(jde-run-option-application-args "./config/Config.py")
 '(jde-db-option-application-args "./config/Config.py")

 '(jde-sourcepath (quote ("./src/main/java" "./src/test/java")))
 '(jde-global-classpath (quote ("./src/main/resources" "./target/classes" "/usr/share/java")))
 '(jde-built-class-path (quote ("./target/classes" "./target/test/classes")))

 ;; M-x jde-xref-customize
 '(jde-xref-db-base-directory "./xrefdb")
 '(jde-xref-store-prefixes (quote ("com.example")))
 '(jde-xref-cache-size 3)
 )

(defun flymake-java-ecj-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy 'jde-ecj-create-temp-file))
         (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
    (list "java" (list "-jar" (concat local-load-path "/ecj-3.6.1.jar")
                       "-classpath" (jde-build-classpath jde-global-classpath) "-sourcepath" (jde-build-classpath jde-sourcepath)
                       "-d" "/dev/null" "-source" "1.5" "-target" "1.5" "-proceedOnError" "-Xemacs"
                       local-file))))

(defun jde-int-generate-shell-command ()
  (interactive)
  (with-temp-file (concat jde-compile-option-directory "/../execute.sh")
    (insert (format "$JAVA_HOME/bin/java -cp %s %s %s" (apply #'concat (mapcar #'(lambda (x) (concat x ":")) jde-global-classpath))
		    jde-run-application-class
		    jde-run-option-application-args))))
