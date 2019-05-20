%% INPUT %%
% pellet(X,Y).
% pacman(X,Y).
% ghost(X,Y, name).
% tile(X,Y).
% closestPellet(X,Y).
% distanceClosestPellet(X,Y).
% previous_action(X). %% left, right, up, down
% min_distance(Xp,Yp,Xg,Yg,D).
% distance/1

next(left) | next(right) | next(up) | next(down).
:-next(left), not_next(left).
:-next(right), not_next(right).
:-next(up), not_next(up).
:-next(down), not_next(down).

distance(1..10).

nextCell(X,Y) :- pacman(Px, Y), next(right), X=Px+1, tile(X,Y).
nextCell(X,Y) :- pacman(Px, Y), next(left), X=Px-1, tile(X,Y).
nextCell(X,Y) :- pacman(X, Py), next(up), Y=Py+1, tile(X,Y).
nextCell(X,Y) :- pacman(X, Py), next(down), Y=Py-1, tile(X,Y).

empty(X,Y) :- tile(X,Y), not pellet(X,Y).

distancePacmanNextGhost(D, G) :- nextCell(Xp, Yp), ghost(Xg, Yg, G), min_distance(Xp,Yp,Xg,Yg,D).

notMinDistancePacmanNextGhost(X) :- distancePacmanNextGhost(X,_), distancePacmanNextGhost(Y,_), distance(X), X>Y.
minDistancePacmanNextGhost(MD) :- not notMinDistancePacmanNextGhost(MD), distancePacmanNextGhost(MD,_).
%minDistancePacmanNextGhost(MD) :- #min{D : distancePacmanNextGhost(D, _)} = MD, distance(MD).

:~ minDistancePacmanNextGhost(MD), Min=10-MD, not powerup. [Min@4, Min,MD]
:~ minDistancePacmanNextGhost(MD), powerup. [MD@4, MD]

:~ nextCell(X,Y), empty(X,Y). [1@3, X,Y]
:~ nextCell(X,Y), closestPellet(X,Y), distanceClosestPellet(D). [D@2, D,X,Y]
:~ previous_action(X), next(Y), X!=Y. [1@1, X,Y]


adjacent(X1,Y1,X2,Y2) :- tile(X1,Y1), tile(X2,Y2), step(DX,DY), X2 = X1 + DX, Y2 = Y1 + DY.
adjacent(X1,Y1,X2,Y2) :- tile(X1,Y1), tile(X2,Y2), step(DX,DY), X2 = X1 - DX, Y2 = Y1 - DY.
step(0,1).
step(1,0).

distance(X1,Y1,X2,Y2,1) :- tile(X1,Y1), adjacent(X1,Y1,X2,Y2).
distance(X1,Y1,X3,Y3,Dp1) :- distance(X1,Y1,X2,Y2,D), adjacent(X2,Y2,X3,Y3), D = Dp1 - 1, number(Dp1).

%min_distance(X1,Y1,X2,Y2,MD) :- #min{D : distance(X1,Y1,X2,Y2,D)} = MD, tile(X1,Y1), tile(X2,Y2), number(MD).

nonMinDistance(X1,Y1,X2,Y2,D1) :- distance(X1,Y1,X2,Y2,D1), distance(X1,Y1,X2,Y2,D2), D1>D2.
min_distance(X1,Y1,X2,Y2,MD):- not nonMinDistance(X1,Y1,X2,Y2,MD), distance(X1,Y1,X2,Y2,MD).

#show next/1.
