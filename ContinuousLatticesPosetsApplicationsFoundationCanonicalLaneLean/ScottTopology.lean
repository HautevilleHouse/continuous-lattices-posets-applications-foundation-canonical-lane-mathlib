import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

structure ScottTopology (L : Type u) (CL : ContinuousLattice L) where
  opens : Set (Set L)
  upwardClosed : forall (U : Set L) (x y : L), U ∈ opens -> x ∈ U -> x ≤ y -> y ∈ U
  neighborhoodCondition : forall (d : Set L), CL.directedSup d ∈ U -> U ∈ opens -> exists (y : L), y ∈ d ∧ (forall (z : L), z ≥ y -> z ∈ U)

structure ScottTopologyEvidence (L : Type u) (CL : ContinuousLattice L) (ST : ScottTopology L CL) where
  upwardClosedClosed : forall (U : Set L) (x y : L), U ∈ ST.opens -> x ∈ U -> x ≤ y -> y ∈ U
  neighborhoodConditionClosed : forall (U : Set L) (d : Set L), CL.directedSup d ∈ U -> U ∈ ST.opens -> exists (y : L), y ∈ d ∧ (forall (z : L), z ≥ y -> z ∈ U)

def ScottTopologyClosed (L : Type u) (CL : ContinuousLattice L) (ST : ScottTopology L CL) : Prop :=
  (forall (U : Set L) (x y : L), U ∈ ST.opens -> x ∈ U -> x ≤ y -> y ∈ U) ∧
  (forall (U : Set L) (d : Set L), CL.directedSup d ∈ U -> U ∈ ST.opens -> exists (y : L), y ∈ d ∧ (forall (z : L), z ≥ y -> z ∈ U))

theorem scott_topology_closed_from_evidence (L : Type u) (CL : ContinuousLattice L) (ST : ScottTopology L CL) (E : ScottTopologyEvidence L CL ST) :
    ScottTopologyClosed L CL ST := by
  exact And.intro E.upwardClosedClosed E.neighborhoodConditionClosed

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse