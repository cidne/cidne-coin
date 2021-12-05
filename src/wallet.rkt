#lang racket

;(require crypto)
;(require crypto/all)
(require (only-in crypto get-pk))
(require (only-in crypto generate-private-key))
(require (only-in crypto pk-key->public-only-key))
(require (only-in crypto pk-key->datum))
(require (only-in crypto/all libcrypto-factory))
(require crypto/pkcs8)
(require "utils.rkt")
(require (only-in openssl/sha1 hex-string->bytes))
(require (only-in openssl/sha1 bytes->hex-string))

(struct wallet-enc
  (private-key public-key private-key-enc public-key-enc)
  #:prefab)

(struct wallet
  (private-key public-key)
  #:prefab)

; Make wallet by generating random public and private keys.
(define (make-wallet)
  (letrec ([rsa-impl (get-pk 'rsa libcrypto-factory)]
           [privkey (generate-private-key rsa-impl '((nbits 2048)))]
           [pubkey (pk-key->public-only-key privkey)])
    (wallet (bytes->hex-string
             (pk-key->datum privkey 'PrivateKeyInfo))
            (bytes->hex-string
             (pk-key->datum pubkey 'SubjectPublicKeyInfo)))))

; Make wallet by generating random public and private keys.
(define (make-wallet-enc)
  (define-values (sp out in err)
    (subprocess #f #f #f "/usr/bin/xkcdpass" "-n 3"))
  (define pw (string-join (string-split (port->string out)) "-"))
  (printf "\n\nYour passphrase is: \n~a\nWrite this down and don't forget it!!!\n" pw)
  (printf "This will take a while...\n")
  (letrec ([rsa-impl (get-pk 'rsa libcrypto-factory)]
           [privkey (generate-private-key rsa-impl '((nbits 2048)))]
           [pubkey (pk-key->public-only-key privkey)]
           [enc-privkey (pkcs8-encrypt/pbkdf2-hmac (string->bytes/utf-8 pw) (pk-key->datum privkey 'PrivateKeyInfo) #:iterations 1000000)]
           [enc-pubkey (pkcs8-encrypt/pbkdf2-hmac (string->bytes/utf-8 pw) (pk-key->datum pubkey 'SubjectPublicKeyInfo) #:iterations 1000000)])
    
    (wallet-enc (bytes->hex-string
             (pk-key->datum privkey 'PrivateKeyInfo))
            (bytes->hex-string
             (pk-key->datum pubkey 'SubjectPublicKeyInfo))
            enc-privkey enc-pubkey)))

;  Store wallet after generating a password and hashing the keys
(define (store-wallet wal)
  (struct->file (wallet (wallet-enc-private-key-enc wal) (wallet-enc-public-key-enc wal)) "wallet.data"))

;  Open a stored wallet or call to create and store one.
(define (open-wallet)
  (cond
    [(file-exists? "wallet.data") 
     (printf "Loading Wallet...")
     (define passwd (read-line))
     ;(printf "~a" (wallet-private-key (file->struct "wallet.data")))
     (define privkey (pkcs8-decrypt-key (string->bytes/utf-8 passwd) (wallet-private-key (file->struct "wallet.data"))))
     (define pubkey (pkcs8-decrypt-bytes (string->bytes/utf-8 passwd) (wallet-public-key (file->struct "wallet.data"))))
     (wallet (bytes->hex-string
                          (pk-key->datum privkey 'PrivateKeyInfo))
                         (bytes->hex-string pubkey))]
    [else
        (printf "Wallet not found... Creating...")
        (define wal (make-wallet-enc))
        (store-wallet wal)
        (wallet (wallet-enc-private-key wal)
             (wallet-enc-public-key wal))]))


(provide (struct-out wallet) (struct-out wallet-enc) make-wallet store-wallet open-wallet)
