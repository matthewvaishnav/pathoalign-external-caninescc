# PathoAlign External Canine SCC Validation

Standalone reproducibility package for the external paired-scanner validation of
PathoAlign on the Multi-Scanner Canine Cutaneous Squamous Cell Carcinoma
histopathology dataset.

## Headline result

PathoAlign reduced scanner identifiability on a locked five-fold external test
while preserving same-region retrieval.

| Metric | Paired reference | PathoAlign dep20 | Difference |
|---|---:|---:|---:|
| Scanner probe accuracy | 0.752868 | 0.361408 | -0.380347 sample-blocked contrast |
| Pair cosine average | 0.696022 | 0.729961 | +0.033256 sample-blocked contrast |
| Pair cosine worst | 0.627300 | 0.656736 | +0.033104 sample-blocked contrast |
| Retrieval top-1 average | 0.930637 | 0.933392 | +0.002326 sample-blocked contrast |
| Retrieval top-1 worst | 0.881242 | 0.884431 | +0.001731 sample-blocked contrast |

All predefined success criteria passed over 44 biological sample blocks.

## What is included

- Dataset inspection and annotation correspondence scripts.
- Geometry qualification and P1000 orientation-normalization scripts.
- Patch extraction manifest generation.
- Frozen encoder analysis scripts.
- Locked PathoAlign validation and five-fold test runners.
- Compact result tables and JSON summaries.

## What is not included

The repository intentionally excludes raw TIFFs, extracted JPEG patches, NPZ
feature archives, model checkpoints, and full run directories. These artifacts
are large or regenerable from the public dataset and scripts.

## Reproduction outline

1. Download the public Multi-Scanner Canine SCC dataset.
2. Build or verify the geometry-qualified patch manifests.
3. Extract orientation-normalized patches locally.
4. Extract DINOv2 frozen features.
5. Run experiments/external_multiscanner/run_canine_pathoalign_crossfold.py.
6. Run scripts/external_multiscanner/analyze_canine_pathoalign_crossfold.py.

See docs/results.md for the frozen result statement and claim boundary.

## Claim boundary

This is a representation-identifiability and paired-acquisition validation
study. It is research only and is not clinical, diagnostic, or patient-care
software.
