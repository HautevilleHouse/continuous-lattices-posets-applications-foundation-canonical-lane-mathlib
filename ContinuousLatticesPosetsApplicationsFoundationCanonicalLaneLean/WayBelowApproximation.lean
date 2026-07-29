import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure WayBelowApproximation (L : Type u) (CL : ContinuousLattice L) where
  approximates : L -> L -> Prop
  interpolation : forall (a b : L), approximates a b -> exists (c : L), approximates a c ∧ approximates c b
  supApproximation : forall (s : Set L) (x : L), (forall (y : L), y ∈ s -> approximates y x) -> approximates (CL.sup s) x
  basis : Set L
  basisProperty : forall (x : L), x = CL.directedSup {y : L | y ∈ basis ∧ approximates y x}

structure WayBelowApproximationEvidence (L : Type u) (CL : ContinuousLattice L) (WA : WayBelowApproximation L CL) where
  interpolationClosed : forall (a b : L), WA.approximates a b -> exists (c : L), WA.approximates a c ∧ WA.approximates c b
  supApproximationClosed : forall (s : Set L) (x : L), (forall (y : L), y ∈ s -> WA.approximates y x) -> WA.approximates (CL.sup s) x
  basisPropertyClosed : forall (x : L), x = CL.directedSup {y : L | y ∈ WA.basis ∧ WA.approximates y x}

def WayBelowApproximationClosed (L : Type u) (CL : ContinuousLattice L) (WA : WayBelowApproximation L CL) : Prop :=
  (forall (a b : L), WA.approximates a b -> exists (c : L), WA.approximates a c ∧ WA.approximates c b) ∧
  (forall (s : Set L) (x : L), (forall (y : L), y ∈ s -> WA.approximates y x) -> WA.approximates (CL.sup s) x) ∧
  (forall (x : L), x = CL.directedSup {y : L | y ∈ WA.basis ∧ WA.approximates y x})

theorem way_below_approximation_closed_from_evidence (L : Type u) (CL : ContinuousLattice L) (WA : WayBelowApproximation L CL) (E : WayBelowApproximationEvidence L CL WA) :
    WayBelowApproximationClosed L CL WA := by
  exact And.intro E.interpolationClosed (And.intro E.supApproximationClosed E.basisPropertyClosed)

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse