import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def continuousLatticesProjection : Projection ContinuousLatticesEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem continuous_lattices_projection_idempotent (x : ContinuousLatticesEndgameState) :
    continuousLatticesProjection.toFun (continuousLatticesProjection.toFun x) = continuousLatticesProjection.toFun x := by
  exact continuousLatticesProjection.idempotent x

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse
