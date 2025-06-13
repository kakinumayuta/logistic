using Test
import Revise

import logistic as lg


#Fset(F::Function, tmax::Float64, x0::Float64, a0::Float64, h::Float64)
@testset "const" begin
    a0 = 0.0
    x0 = 0.0
    num = 1000000
    F(x, t) = 5

    for i in 1:4
        tmax = float(i)
        h = tmax / num

        x, a = lg.Fset(F, tmax, x0, a0, h)
        @show x, a
        @test abs(x - 5.0 / 2.0 * i^2) < 1e-3
        @test abs(a - 5.0 * i) < 1e-3
    end
end

@testset "linear" begin
    a0 = 0.0
    x0 = 0.0
    num = 1000000
    F(x, t) = 3 * t

    for i in 1:4
        tmax = float(i)
        h = tmax / num

        x, a = lg.Fset(F, tmax, x0, a0, h)
        @show x, a
        @test abs(x - 1.0 / 2.0 * i^3) < 1e-3
        @test abs(a - 3.0 / 2.0 * i^2) < 1e-3
    end
end


@testset "Parabel" begin
    a0 = -2.0
    x0 = 1.0
    num = 1000000
    F(x, t) = 1 / 2 * t^2

    for i in 1:4
        tmax = float(i)
        h = tmax / num

        x, a = lg.Fset(F, tmax, x0, a0, h)
        @show x, a
        @test abs(x - (1 / 24 * tmax^4 - 2 * tmax + 1)) < 1e-3
        @test abs(a - (1 / 6 * tmax^3 - 2)) < 1e-3
    end
end


