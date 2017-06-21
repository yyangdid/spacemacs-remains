;;; packages.el --- scrivener layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: LdBeth <andpuke@foxmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `scrivener-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `scrivener/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `scrivener/pre-init-PACKAGE' and/or
;;   `scrivener/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst scrivener-packages
  '(wc-mode
    artbollocks-mode
    writeroom-mode
    dklrt
    muse
    (planner :location local))
  "The Scrivener Layer, with some powerful writing tools.")

(defun scrivener/init-wc-mode ()
  "Initialize `wc-mode'."
  (use-package wc-mode
    :defer t
    :config
    (setq wc-modeline-format "[%tw:%w/%gw]")))

(defun scrivener/init-artbollocks-mode ()
  "Initialize `artbollocks-mode'."
  (use-package artbollocks-mode
    :defer t
    :init
    (spacemacs|add-toggle artbollocks-grammar
      :mode artbollocks-mode
      :documentation "An Emacs minor mode for avoiding cliches and bad grammar when writing about art (or other topics)"
      :evil-leader "xwg"
      :on (font-lock-fontify-buffer))))

(defun scrivener/init-writeroom-mode ()
  "Initialize `writeroom-mode'."
  (use-package writeroom-mode
    :defer t
    :init
    (setq writeroom-fullscreen-effect 'fullscreen)))

(defun scrivener/init-dklrt ()
  "Initialize dklrt."
  (use-package dklrt
    :defer t))

(defun scrivener/init-muse ()
  "Initialize Muse."
  (use-package muse
    :defer t))

(defun scrivener/init-planner ()
  "Initialize Planner."
  (use-package planner
    :defer t))

;;; packages.el ends here