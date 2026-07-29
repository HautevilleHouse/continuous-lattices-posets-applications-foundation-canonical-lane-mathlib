import continuousLatticesPosetsApplicationsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ContinuousLatticeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse