import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure ContinuousLattice (L : Type u) where
  le : L -> L -> Prop
  sup : L -> L -> L
  inf : L -> L -> L
  directedSup : (Set L) -> L
  isPartialOrder : PartialOrder L
  isLattice : Lattice L
  isContinuous : forall (x : L), x = directedSup {y : L | y << x}
  wayBelow : L -> L -> Prop
  wayBelowDef : forall (a b : L), wayBelow a b ↔ (forall (d : Set L), (directedSup d) ≥ b -> exists (c : L), c ∈ d ∧ a ≤ c)

structure ContinuousLatticeEvidence (L : Type u) (CL : ContinuousLattice L) where
  isPartialOrderClosed : CL.isPartialOrder
  isLatticeClosed : CL.isLattice
  isContinuousClosed : CL.isContinuous
  wayBelowClosed : forall (a b : L), CL.wayBelow a b ↔ (forall (d : Set L), (CL.directedSup d) ≥ b -> exists (c : L), c ∈ d ∧ a ≤ CL.sup c)

def ContinuousLatticeClosed (L : Type u) (CL : ContinuousLattice L) : Prop :=
  CL.isPartialOrder ∧ CL.isLattice ∧ CL.isContinuous

theorem continuous_lattice_closed_from_evidence (L : Type u) (CL : ContinuousLattice L) (E : ContinuousLatticeEvidence L CL) :
    ContinuousLatticeClosed L CL := by
  exact And.intro E.isPartialOrderClosed (And.intro E.isLatticeClosed E.isContinuousClosed)

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse