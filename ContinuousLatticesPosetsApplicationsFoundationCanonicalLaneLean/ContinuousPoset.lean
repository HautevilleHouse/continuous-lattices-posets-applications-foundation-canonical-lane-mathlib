import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure ContinuousPoset (P : Type u) where
  le : P -> P -> Prop
  directedSup : (Set P) -> P
  isPartialOrder : PartialOrder P
  isDirectedComplete : forall (d : Set P), DirectedOn (· ≤ ·) d -> exists (x : P), isLUB d x
  wayBelow : P -> P -> Prop
  interpolation : forall (a b : P), wayBelow a b -> exists (c : P), wayBelow a c ∧ wayBelow c b
  approximation : forall (x : P), x = directedSup {y : P | wayBelow y x}

structure ContinuousPosetEvidence (P : Type u) (CP : ContinuousPoset P) where
  isPartialOrderClosed : CP.isPartialOrder
  isDirectedCompleteClosed : forall (d : Set P), DirectedOn (· ≤ ·) d -> exists (x : P), isLUB d x
  interpolationClosed : forall (a b : P), CP.wayBelow a b -> exists (c : P), CP.wayBelow a c ∧ CP.wayBelow c b
  approximationClosed : forall (x : P), x = CP.directedSup {y : P | CP.wayBelow y x}

def ContinuousPosetClosed (P : Type u) (CP : ContinuousPoset P) : Prop :=
  CP.isPartialOrder ∧
  (forall (d : Set P), DirectedOn (· ≤ ·) d -> exists (x : P), isLUB d x) ∧
  (forall (a b : P), CP.wayBelow a b -> exists (c : P), CP.wayBelow a c ∧ CP.wayBelow c b) ∧
  (forall (x : P), x = CP.directedSup {y : P | CP.wayBelow y x})

theorem continuous_poset_closed_from_evidence (P : Type u) (CP : ContinuousPoset P) (E : ContinuousPosetEvidence P CP) :
    ContinuousPosetClosed P CP := by
  exact And.intro E.isPartialOrderClosed (And.intro E.isDirectedCompleteClosed (And.intro E.interpolationClosed E.approximationClosed))

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse