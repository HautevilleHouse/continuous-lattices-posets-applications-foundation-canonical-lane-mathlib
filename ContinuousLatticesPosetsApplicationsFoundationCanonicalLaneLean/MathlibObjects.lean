import continuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ContinuousLatticeSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  partialOrder : PartialOrder carrier
  directedSupremumProperty : Prop

structure ContinuousLatticeAdmittedObject where
  space : ContinuousLatticeSpace
  continuousLatticeStructure : Prop
  meetSemilattice : Prop
  completeLattice : Prop
  wayBelowRelation : carrier → carrier → Prop
  approximationProperty : Prop
  conclusion : continuousLatticeStructure ∧ meetSemilattice ∧ completeLattice ∧ approximationProperty

structure ContinuousLatticeEndgameState where
  object : ContinuousLatticeAdmittedObject

def ContinuousLatticeWitnessClosed (O : ContinuousLatticeAdmittedObject) : Prop :=
  O.conclusion

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse