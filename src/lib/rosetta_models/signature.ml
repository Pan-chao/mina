(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Signature.t : Signature contains the payload that was signed, the public keys of the keypairs used to produce the signature, the signature (encoded in hex), and the SignatureType. PublicKey is often times not known during construction of the signing payloads but may be needed to combine signatures properly.
 *)

type t =
  { signing_payload : Signing_payload.t
  ; public_key : Public_key.t
  ; signature_type : Enums.signaturetype
  ; hex_bytes : string
  }
[@@deriving yojson { strict = false }, show]

(** Signature contains the payload that was signed, the public keys of the keypairs used to produce the signature, the signature (encoded in hex), and the SignatureType. PublicKey is often times not known during construction of the signing payloads but may be needed to combine signatures properly. *)
let create (signing_payload : Signing_payload.t) (public_key : Public_key.t)
    (signature_type : Enums.signaturetype) (hex_bytes : string) : t =
  { signing_payload; public_key; signature_type; hex_bytes }
