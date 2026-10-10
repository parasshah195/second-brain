import Base
import ./src/metadata.bend as Metadata

# Draft contract: owner review required before treating these laws as approved.
law user_assertion_wins:
  for +value: String
  for inferred: String
  {Metadata.resolve(Some{value}, inferred) == value : String}

law inference_is_fallback:
  for +inferred: String
  {Metadata.resolve(None{}, inferred) == inferred : String}
