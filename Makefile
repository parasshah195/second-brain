.PHONY: check verdict
check:
	bend PROOF.bend

verdict: check
	bend PROOF.bend --verdict
