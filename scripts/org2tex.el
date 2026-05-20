;; org2tex.el -- batch org-to-LaTeX exporter for ruhiCV
;; Usage: emacs --batch -l scripts/org2tex.el curriculum-vitae/literate_cv.org
(package-initialize)
(require 'ox)
(require 'ox-latex)

(condition-case nil
    (progn
      (require 'ox-extra)
      (ox-extras-activate '(ignore-headlines)))
  (file-missing
   (advice-add 'org-latex-headline :around
     (lambda (orig headline contents info)
       (if (member "ignore" (org-element-property :tags headline))
           (or contents "")
         (funcall orig headline contents info))))))

(setq org-latex-packages-alist nil)
(setq org-latex-with-hyperref nil)
(setq org-latex-hyperref-template nil)
(setq org-latex-minted-options nil)
(setq org-latex-listings 'listings)
(setq org-confirm-babel-evaluate nil)
(setq org-latex-prefer-user-labels t)
(setq org-export-time-stamp-file nil)

(add-to-list 'org-latex-classes
  '("moderncv"
    "\\documentclass[11pt,a4paper,final,factor=1100,stretch=16,shrink=16]{moderncv}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")))

(let ((org-file (car command-line-args-left)))
  (unless org-file
    (error "missing org file"))
  (find-file org-file)
  (org-babel-tangle)
  (org-latex-export-to-latex))
