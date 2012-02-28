(jde-project-file-version "1.0")
(jde-set-variables
 '(jde-jdk (quote ("1.6.0")))

 '(jde-compile-option-command-line-args nil)
 '(jde-read-compile-args nil)
 '(jde-compile-option-directory "./target/classes")
 '(jde-compile-vm-args nil)

 '(jde-run-working-directory ".")
 '(jde-run-application-class "com.example.Main")
 '(jde-run-read-vm-args nil)
 '(jde-run-read-app-args nil)
 '(jde-run-option-properties nil)
 ;; '(jde-run-option-heap-size (quote ((1 . "megabytes") (16 . "megabytes"))))
 ;; '(jde-run-option-stack-size (quote ((128 . "kilobytes") (400 . "kilobytes"))))
 ;; '(jde-run-option-garbage-collection (quote (t t)))
 '(jde-run-option-vm-args (quote ("-Xdebug" "-Xrunjdwp:transport=dt_socket,address=6001,server=y,suspend=n" "-Xnoagent" "-Djava.compiler=NONE")))
 '(jde-run-option-application-args nil)

 '(jde-db-read-vm-args nil)
 '(jde-db-read-app-args nil)
 '(jde-db-option-vm-args nil)
 '(jde-db-option-application-args nil)

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
