module logistic

#F:力の関数,tmax:終時刻,x0:xの初期値,a0:aの初期値,h:刻み幅
function Fset(F::Function, tmax::Float64, x0::Float64, a0::Float64, h::Float64)
    #初期値
    t = 0.0
    x = x0
    a = a0


    while t < tmax
        a += h * F(x, t)
        x += h * a
        t += h
    end

    return x, a
end

end # module logistic
