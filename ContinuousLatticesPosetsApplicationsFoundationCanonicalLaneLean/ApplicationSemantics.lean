import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.FixedPointTheorem
import HautevilleHouse.ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.DomainTheory

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure DenotationalSemantics (X : Type u) [Preorder X] (L : ContinuousLattice X) (D : Domain X L) where
  interpretation : Type v
  soundnessCondition : Prop
  completenessCondition : Prop

def DenotationalSemanticsEvidence {X : Type u} [Preorder X] {L : ContinuousLattice X} {D : Domain X L} (S : DenotationalSemantics X L D) : Prop :=
  S.soundnessCondition ∧ S.completenessCondition

def DenotationalSemanticsClosed {X : Type u} [Preorder X] {L : ContinuousLattice X} {D : Domain X L} (S : DenotationalSemantics X L D) : Prop :=
  S.soundnessCondition ∧ S.completenessCondition

theorem denotational_semantics_closed_from_evidence {X : Type u} [Preorder X] {L : ContinuousLattice X} {D : Domain X L} (S : DenotationalSemantics X L D) (E : DenotationalSemanticsEvidence S) : 
    DenotationalSemanticsClosed S := by
  exact E

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse