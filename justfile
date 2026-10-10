# Check the Bend laws.
check:
    bend PROOF.bend

# Check the laws again with the independent BendTT kernel.
verdict: check
    bend PROOF.bend --verdict
