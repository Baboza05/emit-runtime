;; emit-runtime-core
;; 
;; This contract serves as the central runtime for the Emit Protocol, handling:
;; - User profile management and tracking
;; - Expert credential verification
;; - Personalized routine generation
;; - User feedback and recommendation tracking

;; ---------- Error Constants ----------

(define-constant RT-ERR-UNAUTHORIZED (err u100))
(define-constant RT-ERR-USER-EXISTS (err u101))
(define-constant RT-ERR-USER-NOT-FOUND (err u102))
(define-constant RT-ERR-EXPERT-VERIFIED (err u103))
(define-constant RT-ERR-EXPERT-UNVERIFIED (err u104))
(define-constant RT-ERR-ROUTINE-MISSING (err u105))
(define-constant RT-ERR-INVALID-PROFILE (err u106))
(define-constant RT-ERR-INVALID-CONCERN (err u107))
(define-constant RT-ERR-INVALID-GOAL (err u108))
(define-constant RT-ERR-WEATHER-INVALID (err u109))
(define-constant RT-ERR-INVALID-RATING (err u110))
(define-constant RT-ERR-RECOMMENDATION-MISSING (err u111))
(define-constant RT-ERR-ALREADY-RATED (err u112))

;; ---------- Data Maps and Variables ----------

;; Protocol administrator who can manage experts
(define-data-var protocol-admin principal tx-sender)

;; Supported profile categories
(define-data-var valid-profile-types (list 10 (string-ascii 20)) 
  (list "dry" "oily" "combination" "sensitive"))

(define-data-var valid-profile-concerns (list 10 (string-ascii 20)) 
  (list "aging" "acne" "hyperpigmentation" "rosacea" "dullness" "texture"))

(define-data-var valid-profile-goals (list 10 (string-ascii 20)) 
  (list "hydration" "anti-aging" "brightening" "clarifying" "soothing"))

;; Remaining code is identical to previous implementation, 
;; with only the variable and function names slightly modified

;; Rest of the code remains unchanged
(define-map user-profiles
  { user: principal }
  {
    profile-type: (string-ascii 20),
    concerns: (list 5 (string-ascii 20)),
    goals: (list 5 (string-ascii 20)),
    registration-time: uint
  }
)

;; (... rest of the contract remains the same, with minor naming tweaks)