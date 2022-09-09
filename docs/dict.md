## Create dictionary



## Prerequisites

- OCR text files of dictionary



## Corrections

- correct mistakes, e.g. ":"
- use modern grammar, e.g. "ck" instead of "kk", "ß" instead of "ss"
- make consistent, e.g. "z.B." instead of "z. B."
- expand shorthands, e.g. "zusammen" instead of "zs", "jemand" instead of "jmd", "und" instead of "u.", etc.
- expand shorthands accross fields, e.g. "XYZ, X.", "X-, Y-Z", "Z-X, -Y", etc.
- check grammar
- check alphabetic sort
- create unified tag syntax, e.g. `{fig.}`, `{ugs.}`, etc.



## Format

- (?) make semicolon field separator
- (?) change wrong semicolons to numbers and vice versa, e.g. `ხულუზს {psch.} Bed. s. ხულ; auf die Beute stoßen`
- (?) remove tags from semicolon list
- (?) distribute ORs into fields, e.g. `X od. Y`, `X/Y`, etc.
- (?) distribute parentheses into fields, e.g. `(x)y` and `y(x)z`, etc.
- (?) replace and remove symbols "/", "(", ")", "-", "od.", "usw.", "bzw.", '"', "u. ä.", "Pkt."
- (?) replace double reference with single reference, e.g. `s. X bzw Y` with `s. X`
- (?) replace dual references
- (?) replace "references of meaning" identical to "references"



## Parse

- parse definitions
  - by number e.g. `X`, `1. X 2. X`, etc.
  - if doesn't start with number, assume single `1.`
  - check: numerical ascending
- parse definition
  - parse tags
  - parse reference, e.g. `s. Y (Pkt. 1)`, `Bed. s. Y`, etc.
  - parse value, else
- parse reference
- parse value
  - split by semicolon
- parse tags
  - extract curly braces
  - split by comma
  - sort alphabetical
- save as JSON



## Transform

- check referenced entry exists