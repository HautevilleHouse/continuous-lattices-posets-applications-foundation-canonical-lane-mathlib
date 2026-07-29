import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLatticeStructure
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.WayBelowApproximation

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure DomainTheory (L : Type u) (CL : ContinuousLattice L) where
  functionSpace : Type u
  retraction : (L -> L) -> L
  retractionProperty : forall (f : L -> L), scottContinuous f -> retraction f ∈ L ∧ retraction f = f (retraction f)
  embeddingProjection : (L -> L) -> L
  epProperty : forall (f : L -> L), scottContinuous f -> embeddingProjection f = retraction f

structure DomainTheoryEvidence (L : Type u) (CL : ContinuousLattice L) (DT : DomainTheory L CL) where
  retractionPropertyClosed : forall (f : L -> L), scottContinuous f -> DT.retraction f ∈ (Set.univ : Set L) ∧ DT.retraction f = f (DT.retraction f)
  epPropertyClosed : forall (f : L -> L), scottContinuous f -> DT.embeddingProjection f = DT.retraction f

def DomainTheoryClosed (L : Type u) (CL : ContinuousLattice L) (DT : DomainTheory L CL) : Prop :=
  (forall (f : L -> L), scottContinuous f -> DT.retraction f ∈ (Set.univ : Set L) ∧ DT.retraction f = f (DT.retraction f)) ∧
  (forall (f : L -> L), scottContinuous f -> DT.embeddingProjection f = DT.retraction f)

theorem domain_theory_closed_from_evidence (L : Type u) (CL : ContinuousLattice L) (DT : DomainTheory L CL) (E : DomainTheoryEvidence L CL DT) :
    DomainTheoryClosed L CL DT := by
  exact And.intro E.retractionPropertyClosed E.epPropertyClosed

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse