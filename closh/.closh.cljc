(require '[clojure.string :as str])
#?(:cljs
   (require '[cljs.nodejs]
            '[lumo.io :refer [slurp spit]]))

(defn args->str [args]
  (->> args
      (map #(str "'" (clojure.string/replace % #"'" "'\"'\"'") "'"))
      (clojure.string/join " ")))

#?(:cljs
   (defcmd from-json [& args]
     (-> (js/JSON.parse (first args))
         (js->clj :keywordize-keys true))))

#?(:cljs
   (defcmd to-json [& args]
     (-> (clj->js (first args))
         (js/JSON.stringify))))

;#?(:clj (load-file (str (getenv "HOME") "/.closh_data_utils.cljc")))
;(load-file (str (getenv "HOME") "/.closh_macros.clj"))
;(load-file (str (getenv "HOME") "/.closh_functions.cljc"))
;(load-file (str (getenv "HOME") "/.closh_lib.cljc"))
;(load-file (str (getenv "HOME") "/.closh_private.cljc"))
;(load-file (str (getenv "HOME") "/.closh_autojump.cljc"))

(defmacro each [expr & body]
  `#(doseq [~expr %] (closh.zero.macros/sh ~@body)))

(defn add-dependencies
  "A helper function to lazily load dependencies using Pomegranate."
  [& args]
  (when-not (find-ns 'cemerick.pomegranate)
    (require '[cemerick.pomegranate]))
  (apply (resolve 'cemerick.pomegranate/add-dependencies)
         (concat args
                 [:repositories (merge @(resolve 'cemerick.pomegranate.aether/maven-central) {"clojars" "https://clojars.org/repo"})])))

#_(defn closh-prompt []
  (clojure.string/join
   " "
   (remove
    nil?
    [
     (color/bold (color/blue (current-hostname)))
     (color/bold (color/blue "::"))
     (color/bold (color/magenta (current-dir)))
     (color/bold (color/red "☭ "))
     (when-let [b (git-current-branch)]
       (str (color/bold (color/blue "git:("))
            (color/bold (color/red b))
            (color/bold (color/blue ")"))))

     (when (git-dirty?)
       (color/bold (color/yellow  "✗")))
     ""])))

(defn start-nrepl
  ([] (start-nrepl 7888))
  ([port]
   (eval
    `(do
       (require '[cemerick.pomegranate])
       (cemerick.pomegranate/add-dependencies
        :coordinates '[[org.clojure/tools.nrepl "0.2.13"]]
        :repositories (merge cemerick.pomegranate.aether/maven-central
                             {"clojars" "https://clojars.org/repo"}))
       (require '[clojure.tools.nrepl.server])
       (println "Starting nrepl at" ~port)
       (defonce server (clojure.tools.nrepl.server/start-server :port ~port))))))
