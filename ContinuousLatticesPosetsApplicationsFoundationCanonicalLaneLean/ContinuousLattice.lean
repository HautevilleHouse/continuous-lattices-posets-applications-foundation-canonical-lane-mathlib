import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure ContinuousLattice (P : Type u) [Preorder P] where
  directedSup : (Set P) → P
  continuousCondition : ∀ (x : P), x = directedSup {y : P | y << x}
  wayBelowTransitive : ∀ {x y z : P}, x << y → y << z → x << z
  interpolation : ∀ {x z : P}, x << z → ∃ y, x << y ∧ y << z

def wayBelow {P : Type u} [Preorder P] (x y : P) : Prop :=
  ∀ (D : Set P) (hD : DirectedOn (· ≤ ·) D), y ≤ directedSup D → ∃ d ∈ D, x ≤ d
  where
    directedSup (S : Set P) : P := ⨆ S

structure ContinuousLatticeEvidence (L : ContinuousLattice P) where
  directedSupDefined : True
  continuousConditionHolds : ∀ (x : P), x = L.directedSup {y : P | y << x}
  wayBelowTransitiveHolds : ∀ {x y z : P}, x << y → y << z → x << z
  interpolationHolds : ∀ {x z : P}, x << z → ∃ y, x << y ∧ y << z

def ContinuousLatticeClosed (L : ContinuousLattice P) : Prop :=
  ∀ (x : P), x = L.directedSup {y : P | y << x} ∧
  (∀ {x y z : P}, x << y → y << z → x << z) ∧
  (∀ {x z : P}, x << z → ∃ y, x << y ∧ y << z)

theorem continuous_lattice_closed_from_evidence (L : ContinuousLattice P)
    (E : ContinuousLatticeEvidence L) : ContinuousLatticeClosed L := by
  intro x
  refine ⟨E.continuousConditionHolds x, ?_, ?_⟩
  · exact E.wayBelowTransitiveHolds
  · exact E.interpolationHolds

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse