; Calculate x = l0*C(theta0) + l1*C(theta0-theta1) + l2*C(theta2-theta0+theta1)
LOAD R4, theta0          ; Load theta0
COS  FP1, R4             ; Compute cos(theta0) -> FP1
FMUL FP1, R1, FP1        ; Multiply l0*cos(theta0) -> FP1

LOAD R4, theta0          ; Reload theta0
LOAD R5, theta1          ; Load theta1
FSUB R7, R4, R5          ; Compute theta0-theta1 -> R7
COS  FP2, R7             ; Compute cos(theta0-theta1) -> FP2
FMUL FP2, R2, FP2        ; Multiply l1*cos(theta0-theta1) -> FP2

LOAD R6, theta2          ; Load theta2
FSUB R7, R6, R4          ; Compute theta2-theta0 -> R7
FADD R7, R7, R5          ; Compute theta2-theta0+theta1 -> R7
COS  FP3, R7             ; Compute cos(theta2-theta0+theta1) -> FP3
FMUL FP3, R3, FP3        ; Multiply l2*cos(theta2-theta0+theta1) -> FP3

FADD X, FP1, FP2         ; Add FP1 and FP2 -> X
FADD X, X, FP3           ; Add FP3 to X -> X (Final result for x)