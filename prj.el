(jde-project-file-version "1.0")
(jde-set-variables
 '(jde-jdk-registry (quote (("1.6.0" . "$JAVA_HOME"))))
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-doc-url "http://download.oracle.com/javase/6/docs/api")
 '(jde-enable-abbrev-mode t)
 '(jde-gen-k&r t)
 '(jde-gen-cflow-enable t)
 '(jde-complete-function (quote jde-complete-minibuf))
 '(jde-electric-return-p t)
 '(jde-import-auto-collapse-imports nil)
 '(jde-import-auto-sort t)
 '(jde-import-sorted-groups (quote gor))

 ;; JDE Compile Option Group

 '(jde-compile-enable-kill-buffer nil)
 '(jde-compiler (quote ("javac-server" "")))
 ;; '(jde-compiler (quote (("eclipse java compiler server" "/usr/share/java/eclipse-ecj.jar"))))
 '(jde-quote-classpath t)
 '(jde-compile-option-deprecation t)
 '(jde-compile-option-debug (quote ("all" (t t t))))
 '(jde-compile-option-optimize nil)
 ;; '(jde-compile-option-depend nil)
 ;; '(jde-compile-option-depend-switch (quote ("-Xdepend")))
 '(jde-compile-option-verbose t)
 '(jde-compile-option-nowarn nil)
 ;; '(jde-compile-option-encoding "EUCJIS\SJIS")
 ;; '(jde-compile-option-bootclasspath nil)
 ;; '(jde-compile-option-extdirs nil)

 ;; JDE Build Option Group

 '(jde-build-function (quote (jde-ant-build)))
 '(jde-ant-invocation-method (quote ("Script")))
 '(jde-ant-home "$ANT_HOME")
 '(jde-ant-user-jar-files "$ANT_CONTRIB")
 '(jde-ant-program "ant")
 '(jde-ant-args "-emacs")
 '(jde-ant-buildfile "build.xml")
 '(jde-ant-read-buildfile nil)
 '(jde-ant-read-target t)
 '(jde-ant-read-args nil)
 '(jde-ant-enable-find t)
 '(jde-ant-complete-target t)

 ;; JDE Run Option Group

 '(jde-run-mode-hook nil)
 '(jde-run-option-verbose (quote (t t t)))
 ;; '(jde-run-option-java-profile (quote (t . "./java.prof")))
 ;; '(jde-run-option-heap-profile (quote (t "./java.hprof" 4 20 "Allocation objects")))
 '(jde-run-option-verify (quote (nil t)))
 ;; '(jde-run-option-debug (quote ("Server" "Socket" "javadebug" "localhost" "6001" "Yes")))

 ;; '(jde-run-read-vm-args (quote ("-agentlib:hprof")))

 ;; JDE Debug Option Group

 '(jde-debugger (quote ("jdb")))
 '(jde-db-mode-hook nil)
 '(jde-db-option-verbose (quote (t t nil)))

 ;; JDE Autocode Option Group
 )

(jde-gen-define-abbrev-template "melse" '('> "else {" '> 'n '> 'r 'n "}"))

(jde-gen-define-abbrev-template "sysout" '("System.out.println(\"" (p "x:") "\");"))
(jde-gen-define-abbrev-template "syserr" '("System.err.println(\"" (p "x:") "\");"))
(jde-gen-define-abbrev-template "trace" '("logger.trace(\"" (p "Message:") "\");"))
(jde-gen-define-abbrev-template "debug" '("logger.debug(\"" (p "Message:") "\");"))
(jde-gen-define-abbrev-template "info" '("logger.info(\"" (p "Message:") "\");"))
(jde-gen-define-abbrev-template "warn" '("logger.warn(\"" (p "Message:") "\");"))
(jde-gen-define-abbrev-template "error" '("logger.error(\"" (p "Message:") "\");"))
(jde-gen-define-abbrev-template "fatal" '("logger.fatal(\"" (p "Message:") "\");"))

(tempo-define-template "debug"
                       '("if (debug) {" n> "System.out.println(\"" (p "Enter debug message:") "\");" n> "}")
                       "d"
                       "Inserts a print debug message")
