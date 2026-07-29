import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLattice
import HautevilleHouse.ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ScottTopology

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure Domain (D : Type u) where
  partialOrder : Preorder D
  directedCompleteness : DirectedComplete D
  continuousLattice : ContinuousLattice D
  scottTopology : ScottTopology D
  compatibility : Compatible D

def DirectedComplete (D : Type u) [Preorder D] : Prop :=
  ∀ (s : Set D), DirectedOn (· ≤ ·) s → HasLUB s

def HasLUB (D : Type u) [Preorder D] (s : Set D) : Prop :=
  ∃ x, (∀ y ∈ s, y ≤ x) ∧ (∀ z, (∀ y ∈ s, y ≤ z) → x ≤ z)

structure Compatible (D : Type u) where
  scottOpenSets : Set (Set D)
  continuousLatticeStructure : ContinuousLattice D
  compatibilityCondition : ∀ U, U ∈ scottOpenSets ↔ IsScottOpen D U

structure DomainEvidence (D : Domain α) where
  directedCompletenessHolds : DirectedComplete α
  continuousLatticeHolds : ContinuousLatticeClosed D.continuousLattice
  scottTopologyHolds : ScottTopologyClosed D.scottTopology
  compatibilityHolds : Compatible α

def DomainClosed (D : Domain α) : Prop :=
  DirectedComplete α ∧ ContinuousLatticeClosed D.continuousLattice ∧
  ScottTopologyClosed D.scottTopology ∧ Compatible α

theorem domain_closed_from_evidence (D : Domain α) (E : DomainEvidence D) : DomainClosed D := by
  refine ⟨E.directedCompletenessHolds, E.continuousLatticeHolds, E.scottTopologyHolds, E.compatibilityHolds⟩

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse