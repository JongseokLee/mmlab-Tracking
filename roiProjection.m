function [est_motion, temp_state] = roiProjection(Mask, mv, targetState,blockWise,B_AREA_RATIO, ZERO_LEN_LIMIT_POW2)

temp_state = targetState;

temp_state(5) = temp_state(5);
temp_state(6) = temp_state(6);

temp_state(5) = sqrt(temp_state(5)*temp_state(6))*B_AREA_RATIO;
temp_state(6) = sqrt(temp_state(5)*temp_state(6))*B_AREA_RATIO;

temp_state = round(temp_state);


rec = getRecState(temp_state,blockWise);
preMask = Mask(rec(1):rec(2),rec(3):rec(4));
fmv.ver = mv.ver(rec(1):rec(2),rec(3):rec(4));
fmv.hor = mv.hor(rec(1):rec(2),rec(3):rec(4));

[est_motion] = preMaskProjection(preMask, fmv, size(preMask), 1, ZERO_LEN_LIMIT_POW2);

temp_state(1) = temp_state(1) - est_motion.ver;
temp_state(2) = temp_state(2) - est_motion.hor;
end