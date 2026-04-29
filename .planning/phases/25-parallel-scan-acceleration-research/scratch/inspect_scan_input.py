"""Inspect exact scan_fn input format by tracing through input_data."""
from __future__ import annotations

import sys
sys.path.insert(0, r"C:\Users\aman0087\Documents\Github\hgf-analysis\src")

import numpy as np
import jax.numpy as jnp
from prl_hgf.models.hgf_3level import build_3level_network

# Read the input_data method to find the scan_inputs format
import pyhgf.model.network as netmod
import inspect
print(inspect.getsource(netmod.Network.input_data))
