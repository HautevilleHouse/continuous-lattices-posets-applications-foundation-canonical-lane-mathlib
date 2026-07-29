import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.BridgeLemmas
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

def ConstrainedContinuousLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_lattice_endgame (A : AdmissibleClass) :
    ConstrainedContinuousLatticeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse