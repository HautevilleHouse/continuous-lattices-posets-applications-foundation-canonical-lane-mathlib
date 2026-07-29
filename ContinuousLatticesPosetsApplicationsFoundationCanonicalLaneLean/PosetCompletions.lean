import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLattice

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure PosetCompletion (P : Type u) [Preorder P] where
  ideal : Set (Set P)
  idealProperties : ∀ I ∈ ideal, IsIdeal I
  completionOrder : Preorder (Set P)
  embedding : P → Set P
  embeddingIsOrderEmbedding : ∀ a b : P, a ≤ b ↔ embedding a ⊆ embedding b

def IsIdeal {P : Type u} [Preorder P] (I : Set P) : Prop :=
  Nonempty I ∧ DirectedOn (· ≤ ·) I ∧ ∀ x y, x ≤ y → y ∈ I → x ∈ I

structure PosetCompletionEvidence (C : PosetCompletion P) where
  idealPropertiesHolds : ∀ I ∈ C.ideal, IsIdeal I
  embeddingIsOrderEmbeddingHolds : ∀ a b : P, a ≤ b ↔ C.embedding a ⊆ C.embedding b

def PosetCompletionClosed (C : PosetCompletion P) : Prop :=
  (∀ I ∈ C.ideal, IsIdeal I) ∧ (∀ a b : P, a ≤ b ↔ C.embedding a ⊆ C.embedding b)

theorem poset_completion_closed_from_evidence (C : PosetCompletion P)
    (E : PosetCompletionEvidence C) : PosetCompletionClosed C := by
  refine ⟨E.idealPropertiesHolds, E.embeddingIsOrderEmbeddingHolds⟩

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse