# Paired-Acquisition Neural Factorization external validation on multi-scanner canine SCC

## Status

**Result:** passed locked external validation.

This note freezes the external paired-acquisition validation of Paired-Acquisition Neural Factorization on the public Multi-Scanner Canine Cutaneous Squamous Cell Carcinoma histopathology dataset.

## Positioning boundary

This is a representation-identifiability study. It evaluates whether a locked paired-acquisition neural factorization objective can separate tissue identity from acquisition provenance on an independent paired-scanner benchmark.

The supported claim is not that the method proves disease biology. The supported claim is that, in this benchmark, the method reduces linearly recoverable scanner identity in the tissue factor while preserving same-region retrieval and improving cross-scanner cosine consistency.

## Dataset and preprocessing boundary

- Biological samples: 44.
- Scanners: `cs2`, `gt450`, `nz20`, `nz210`, `p1000`.
- Geometry-qualified subset: 805 complete five-view regions, 4,025 image views.
- Raw TIFFs, extracted JPEG patches, frozen feature archives, and checkpoints are intentionally excluded from git.

## Frozen encoder triage on fold-0 validation

| Encoder | Pair cosine avg | Pair cosine worst | Retrieval top-1 avg | Retrieval top-1 worst | Scanner probe accuracy | Effective rank |
|---|---:|---:|---:|---:|---:|---:|
| ResNet50 ImageNet | 0.821860 | 0.749598 | 0.853704 | 0.653439 | 0.857143 | 74.743 |
| DINOv2-Base | 0.908476 | 0.862341 | 0.852381 | 0.727513 | 0.841270 | 51.599 |
| Phikon | 0.810269 | 0.778612 | 0.776190 | 0.640212 | 0.979894 | 59.094 |

**Frozen substrate selected:** DINOv2-Base.

## Locked five-fold external test

Setup:

- Frozen DINOv2-Base features.
- Five sample-blocked folds.
- Each fold uses all non-test samples for fitting and evaluates the held-out fold exactly once.
- Seeds: 911--915.
- Variants: `paired_reference` and `factorized_dep20`.
- Total fits: 50.
- Hyperparameters remained locked.

Descriptive run means:

| Metric | Paired reference | Factorized dep20 | Factorized minus paired |
|---|---:|---:|---:|
| Scanner probe accuracy | 0.752868 | 0.361408 | -0.391460 |
| Pair cosine average | 0.696022 | 0.729961 | +0.033939 |
| Pair cosine worst | 0.627300 | 0.656736 | +0.029437 |
| Retrieval top-1 average | 0.930637 | 0.933392 | +0.002756 |
| Retrieval top-1 worst | 0.881242 | 0.884431 | +0.003189 |
| Effective rank | 79.779 | 74.044 | -5.734 |

Sample-blocked contrasts over 44 biological samples:

| Metric | Mean difference | 95% bootstrap CI | Favorable samples | Monte Carlo sign-flip p |
|---|---:|---:|---:|---:|
| Scanner probe accuracy | -0.380347 | [-0.399616, -0.361107] | 44/44 | 0.000004 |
| Pair cosine average | +0.033256 | [+0.030935, +0.035530] | 44/44 | 0.000004 |
| Pair cosine worst | +0.033104 | [+0.028789, +0.037550] | 44/44 | 0.000004 |
| Retrieval top-1 average | +0.002326 | [+0.000005, +0.004789] | 24/44 | 0.064600 |
| Retrieval top-1 worst | +0.001731 | [-0.005823, +0.009250] | 17/44 | 0.660573 |

Factorization audit means:

| Metric | Mean |
|---|---:|
| Acquisition scanner probe | 0.865098 |
| Acquisition tissue retrieval | 0.180627 |
| Acquisition effective rank | 13.756 |
| Cross-covariance RMS | 0.089831 |

Interpretation: scanner signal remained strongly available in the compact acquisition factor, while same-region tissue retrieval was preserved in the scanner-suppressed tissue factor.

## Claim boundary

Supported claim:

> On an independent external paired-scanner canine SCC benchmark, a paired-acquisition neural factorization projection with hyperparameters locked from SCORPION reduced scanner identifiability by approximately 0.38 absolute while preserving same-region retrieval and improving cross-scanner cosine consistency.

Do not overstate this as proof of disease biology or perfect biological/acquisition factor separation. This is a representation-identifiability and paired-acquisition validation study.
