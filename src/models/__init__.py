"""Minimal model namespace for the external canine SCC PathoAlign study."""

from .scorpion_pathoalign import (
    ProjectionConfig,
    ScorpionProjection,
    projection_loss,
)

__all__ = [
    "ProjectionConfig",
    "ScorpionProjection",
    "projection_loss",
]
