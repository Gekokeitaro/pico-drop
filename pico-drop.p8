pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--pico drop
-- by gekko

--main
game={}; -- game state
camera(0,0);
-- board vars
boards={};
b_const={w=48,h=80};
board_x={0,72};
init_rows=5;
blank_spr=5;
-- player vars
n_pl=2; -- num_players
scores={};
pl_x={24,96};
-- text vars
txt_y=96;
txt_debug={0,104};

function _init()
  start_game();
end

function _update()
  game.upd();
end

function _draw()
  game.drw();  
end

function start_game()
  scores={0,0};
  
  for i=n_pl,1,-1 do
    empty_brd(i);
  end 

  game.upd=upd_game;
  game.drw=drw_game;
end

function empty_brd(_i)
  local b={};
  for i=77,1,-1 do
    local drop={v=blank_spr,x=(i%7*8)+board_x[_i],y=i%11*8};
    add(b,drop);
  end
  add(boards,b);
end

function getBoard(_i)
  return boards[i];
end

function getDrop(board, x, y)
  return board[(x*y)];
end

function changeDrop(drop, n_v)
  drop.v=n_v;
end

function upd_game()
  for i=n_pl,1,-1 do upd_player(i) end
end

function upd_player(pl)
  if btnp(0,pl-1) 
  and pl_x[pl] > board_x[pl] then
    pl_x[pl]-=8;
  end
  if btnp(1,pl-1)
  and pl_x[pl] < getlimit(pl) then
    pl_x[pl]+=8;
  end
end

function getlimit(pl)
  return b_const.w+board_x[pl];
end

function drw_game() 
  cls();
  map(0,0,0,0,16,16); 

  foreach(boards,render);
  for i=n_pl,1,-1 do
    spr((i*2)-1,pl_x[i],b_const.h);
  end
end

function render(_b)
  b=_b;
  for i=#b,1,-1 do
    spr(b[i].v, b[i].x, b[i].y);
  end
end


__gfx__
0000000003300880033008800cc008800cc008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000a033880aaf3388faa0cc880aafcc88fa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700003ff800083ff88000cff80008cff8800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000ffff0008ffff8000ffff0008ffff800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700008a88a8000a88a0008a88a8000a88a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700f0aaaa0f00aaaa00f0aaaa0f00aaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a00a0000a00a0000a00a0000a00a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003300330033003300cc00cc00cc00cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000099999999000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a000000aaaaaaaa000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009a00000000000000000000a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0099900000ccc0000088800000bbb000007990000007000000070000000700000066600000000000000000000000000000000000000000000000000000000000
097999000c7ccc00087888000b7bbb0000090000007cc00000788000007bb0000776770000000000000000000000000000000000000000000000000000000000
97999990c7ccccc087888880b7bbbbb00799990077ccccc00708080007bbbb006766676000000000000000000000000000000000000000000000000000000000
97999990c7ccccc087888880b7bbbbb00079900007cccc007888888007bbbb006666666000000000000000000000000000000000000000000000000000000000
99999990ccccccc088888880bbbbbbb00079900007cccc000708080007bbbb006766676000000000000000000000000000000000000000000000000000000000
099999000ccccc00088888000bbbbb00007990000cc0cc0000080000000b00000776770000000000000000000000000000000000000000000000000000000000
0099900000ccc0000088800000bbb000000900000c000c000088800000bbb0000066600000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000004000000000000000000000000000000000400000004000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0806060606060611130605050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1705050705050511130605050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0805050507160511130605050505050505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0805070505050511130705050715051800050505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0805050505050511130705050005070500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000011130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212121200001212121212121200090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
