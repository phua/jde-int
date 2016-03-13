(jdee-project-file-version "1.0")
(jdee-set-variables
 '(jdee-jdk-registry (quote (("1.7" . "/usr/lib/jvm/java-7-openjdk")
                             ("1.8" . "/usr/lib/jvm/java-8-openjdk"))))
 '(jdee-jdk (quote ("1.8")))
 '(jdee-jdk-doc-url "http://docs.oracle.com/javase/8/docs/api")
 '(jdee-help-docsets (quote ((nil "http://docs.oracle.com/javase/7/docs/api" "1.7")
                             (nil "http://docs.oracle.com/javase/8/docs/api" "1.8")
                             (nil "https://developer.android.com/reference"))))
 '(jdee-enable-abbrev-mode nil)
 '(jdee-gen-k&r t)
 '(jdee-gen-cflow-enable nil)
 '(jdee-complete-function (quote jdee-complete-minibuf))
 '(jdee-electric-return-p t)
 '(jdee-import-auto-collapse-imports nil)
 '(jdee-import-auto-sort t)
 '(jdee-import-sorted-groups (quote gor))

 '(jdee-project-context-switching-enabled-p t)

 ;; '(jdee-expand-classpath-p t)
 ;; '(jdee-lib-directory-names (quote ("/lib$" "/jar$")))

 '(jdee-server-dir "~/workspaces/forks/jdee-server/target/")

 ;; JDE Compile Option Group

 '(jdee-compiler (quote ("javac-server" "")))
 '(jdee-compile-option-command-line-args nil)
 '(jdee-read-compile-args nil)
 '(jdee-compile-option-directory "./target/classes")
 '(jdee-compile-option-deprecation t)
 '(jdee-compile-option-debug (quote ("all" (t t t))))
 '(jdee-compile-option-optimize nil)
 '(jdee-compile-option-depend nil)
 '(jdee-compile-option-vm-args nil)
 '(jdee-compile-option-verbose t)
 '(jdee-compile-option-nowarn nil)
 '(jdee-compile-option-bootclasspath nil)

 '(jdee-compile-enable-kill-buffer nil)

 ;; JDEE Build Option Group

 '(jdee-build-function (quote jdee-ant-build))

 '(jdee-ant-invocation-method (quote ("Script")))
 '(jdee-ant-home "$ANT_HOME")
 '(jdee-ant-user-jar-files "$ANT_CONTRIB_HOME/ant-contrib-1.0b3.jar")
 '(jdee-ant-program "ant")
 '(jdee-ant-args "-emacs")
 '(jdee-ant-buildfile "build.xml")
 '(jdee-ant-read-buildfile nil)
 '(jdee-ant-read-target t)
 '(jdee-ant-interactive-buildfile "build.xml")
 '(jdee-ant-read-args nil)
 '(jdee-ant-enable-find t)
 '(jdee-ant-complete-target t)

 ;; JDEE Run Option Group

 '(jdee-run-working-directory ".")
 '(jdee-run-application-class "com.example.Main")
 '(jdee-run-read-vm-args nil)
 '(jdee-run-read-app-args nil)
 '(jdee-run-option-verbose (quote (t t t)))
 '(jdee-run-option-properties nil)
 ;; '(jdee-run-option-heap-size (quote ((1 . "megabytes") (16 . "megabytes"))))
 ;; '(jdee-run-option-stack-size (quote ((128 . "kilobytes") (400 . "kilobytes"))))
 ;; '(jdee-run-option-garbage-collection (quote (t t)))
 ;; '(jdee-run-option-java-profile (quote (t . "./java.prof")))
 ;; '(jdee-run-option-heap-profile (quote (t "./java.hprof" 5 20 "Allocation objects")))
 '(jdee-run-option-verify (quote (nil t)))
 ;; '(jdee-run-option-vm-args (quote ("-Xdebug" "-Xrunjdwp:transport=dt_socket,address=6001,server=y,suspend=n"
 ;;               "-Xnoagent" "-Djava.compiler=NONE")))
 ;; '(jdee-run-option-debug (quote ("Server" "Socket" "javadebug" "localhost" "6001" "Yes")))
 '(jdee-run-option-application-args nil)

 ;; JDEE Debug Option Group

 '(jdee-debugger (quote ("jdb")))
 '(jdee-db-read-vm-args nil)
 '(jdee-db-read-app-args nil)
 '(jdee-db-option-vm-args nil)
 '(jdee-db-option-application-args nil)

 ;; (jdee-db-option-connect-socket '(nil "6001"))
 ;; (jdee-db-option-connect-shared-memory-name "javadebug")

 ;; JDEE JUnit Option Group

 '(jdee-junit-working-directory jdee-run-working-directory)
 ;; '(jdee-junit-testrunner-type "junit.textui.TestRunner")
 '(jdee-junit-testrunner-type "org.junit.runner.JUnitCore")
 '(jdee-junit-tester-name-tag '("Test" . "Suffix"))

 ;; JDEE Autocode Option Group

 '(jdee-gen-buffer-boilerplate
   (quote ("/**"
           " * Describe class here."
           " *"
           " * @author phua"
           " * @version 1.0"
           " */")))
 )

;; JDEE Cross-Reference Database

;; '(jdee-xref-db-base-directory "./xrefdb")
;; '(jdee-xref-store-prefixes (quote ("com.example")))
;; '(jdee-xref-cache-size 3))

;; JDEE Abbreviation Templates

(jdee-gen-define-abbrev-template "melse"  '('> "else {" '> 'n '> 'r 'n "}"))

(jdee-gen-define-abbrev-template "sysin"  '("System.in.readline();"))
(jdee-gen-define-abbrev-template "sysout" '("System.out.println(\"" (p "x:") "\");"))
(jdee-gen-define-abbrev-template "syserr" '("System.err.println(\"" (p "x:") "\");"))
(jdee-gen-define-abbrev-template "trace"  '("logger.trace(\"" (p "Message:") "\");"))
(jdee-gen-define-abbrev-template "debug"  '("logger.debug(\"" (p "Message:") "\");"))
(jdee-gen-define-abbrev-template "info"   '("logger.info(\"" (p "Message:") "\");"))
(jdee-gen-define-abbrev-template "warn"   '("logger.warn(\"" (p "Message:") "\");"))
(jdee-gen-define-abbrev-template "error"  '("logger.error(\"" (p "Message:") "\");"))
(jdee-gen-define-abbrev-template "fatal"  '("logger.fatal(\"" (p "Message:") "\");"))

(tempo-define-template "debug"
                       '("if (debug) {" n> "System.out.println(\"" (p "Enter debug message:") "\");" n> "}")
                       "d"
                       "Inserts a print debug message")
