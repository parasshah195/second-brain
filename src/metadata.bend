import Base

# User assertions remain authoritative when background inference changes.
def resolve(user: Maybe<&2, String>, inferred: String) -> String:
  match user:
    case None{}:
      inferred
    case Some{value}:
      value
