import numpy as np
import time

params = {"C1": "$C_1$", "C2": "$C_2$", "C3": "$C_3$"}

mins = (-2, 0, 1)
maxs = (2, 1, 3)

def my_prior(cube):
    begin = np.array(mins)
    end = np.array(maxs)
    cube = begin + cube*(end-begin)
    return(cube)

def my_loglikelihood(cube):
    chi = (np.cos(cube / 2.)).prod()
    time.sleep(0.05)
    return (2. + chi)**5
