import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean

def wayBelow {D : DirectedCompletePoset} (x y : D.carrier) : Prop :=
  ∀ (s : Set D.carrier) (h : DirectedOn D.le s) (hsup : D.directedSupremum s h),
    D.le y hsup → ∃ d ∈ s, D.le x d

structure WayBelowEvidence (D : DirectedCompletePoset) where
  approximating : ∀ x : D.carrier,
    ∃ (s : Set D.carrier), DirectedOn D.le s ∧
      (∀ y ∈ s, wayBelow y x) ∧
      D.directedSupremum s (by exact ?_) = x

end ContinuousLatticesPosetsApplicationsFoundationCanonicalLaneLean
end HautevilleHouse