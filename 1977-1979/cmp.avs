v1 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\11214 Bakhtin 02 S8.720p.mov")
v1 = v1.assumefps(18)
v2 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\1 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v2 = v2.assumefps(18)
v3 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\2 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v3 = v3.assumefps(18)
v2 = v2.trim(0, v2.frameCount - 2) + v3.trim(108, 0)

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.gaussResize(w, h)
}

v1 = v1.crop(140,4,-140,-4)/*.extractY.convertToYV24*/.autolevels
v2 = v2.crop(60, 82, -30, -60)/*.extractY.convertToYV24*/.autolevels(ignore_low=0.0003, ignore_high=0.0003, gamma=1.1)
#return v2
v1 = v1.spline64resize(v2.width, v2.height, -20, -60, v1.width + 60, v1.height + 60)
v1 = v1.adjustSize
v2 = v2.adjustSize
v2 = v1.trim(0, 23) + v2
###
v1 = v1.info
v2 = v2.info
v1 = v1.trim(0, 28) + v2.trim(29, 32) + v1.trim(29, 0)
###
v2 = v2.trim(0, 6796) + v1.trim(6797, 6797) + v2.trim(6797, 0)
v2 = v2.trim(0, 12447) + v1.trim(12448, 12459) + v2.trim(12453, 0)
v1 = v1.trim(0, 12496) + v2.trim(12497, 12506) + v1.trim(12500, 0)
v1 = v1.trim(0, 12508) + v2.trim(12509, 12509) + v1.trim(12509, 0)
v1 = v1.trim(0, 12510) + v2.trim(12511, 12511) + v1.trim(12511, 0)
v1 = v1.trim(0, 12512) + v2.trim(12513, 12513) + v1.trim(12513, 0)
v1 = v1.trim(0, 12514) + v2.trim(12515, 12515) + v1.trim(12515, 0)
v1 = v1.trim(0, 12516) + v2.trim(12517, 12517) + v1.trim(12517, 0)
v1 = v1.trim(0, 12518) + v2.trim(12519, 12519) + v1.trim(12519, 0)
v1 = v1.trim(0, 12520) + v2.trim(12521, 12521) + v1.trim(12521, 0)
v1 = v1.trim(0, 12522) + v2.trim(12523, 12523) + v1.trim(12523, 0)
v1 = v1.trim(0, 12524) + v2.trim(12525, 12525) + v1.trim(12525, 0)
v1 = v1.trim(0, 12526) + v2.trim(12527, 12527) + v1.trim(12527, 0)
v1 = v1.trim(0, 12528) + v2.trim(12529, 12529) + v1.trim(12529, 0)

v2 = v2.trim(0, 15961) + v2.trim(15994, 0)
v2 = v2.trim(0, 16625) + v1.trim(16626, 16641) + v2.trim(16643, 0)
v2 = v2.trim(0, 18442) + v1.trim(18443, 18444) + v2.trim(18444, 0)

v2 = v2.trim(0, 18610) + v2.trim(18646, 0)
#v2 = v2.info
v2 = v2.trim(0, 23671) + v1.trim(23672, 23672) + v2.trim(23672, 0)
v2 = v2.trim(0, 23673) + v1.trim(23674, 23674) + v2.trim(23674, 0)
v2 = v2.trim(0, 23676) + v1.trim(23677, 23677) + v2.trim(23677, 0)
v2 = v2.trim(0, 23678) + v1.trim(23679, 23679) + v2.trim(23679, 0)
v2 = v2.trim(0, 23680) + v1.trim(23681, 23681) + v2.trim(23681, 0)
v2 = v2.trim(0, 23682) + v1.trim(23683, 23683) + v2.trim(23683, 0)
v2 = v2.trim(0, 23684) + v1.trim(23685, 23685) + v2.trim(23685, 0)
v2 = v2.trim(0, 23686) + v1.trim(23687, 23687) + v2.trim(23687, 0)
v2 = v2.trim(0, 23688) + v1.trim(23689, 23689) + v2.trim(23689, 0)
v2 = v2.trim(0, 23690) + v1.trim(23691, 23691) + v2.trim(23691, 0)
v2 = v2.trim(0, 23692) + v1.trim(23693, 23693) + v2.trim(23693, 0)
v2 = v2.trim(0, 23694) + v1.trim(23695, 23695) + v2.trim(23695, 0)
v2 = v2.trim(0, 23696) + v1.trim(23697, 23697) + v2.trim(23697, 0)
v2 = v2.trim(0, 23698) + v1.trim(23699, 23699) + v2.trim(23699, 0)
v2 = v2.trim(0, 23700) + v1.trim(23701, 23701) + v2.trim(23701, 0)
v2 = v2.trim(0, 23702) + v1.trim(23703, 23703) + v2.trim(23703, 0)
v2 = v2.trim(0, 23704) + v1.trim(23705, 23705) + v2.trim(23705, 0)
v2 = v2.trim(0, 23706) + v1.trim(23707, 23707) + v2.trim(23707, 0)
v2 = v2.trim(0, 23708) + v1.trim(23709, 23709) + v2.trim(23709, 0)
v2 = v2.trim(0, 23710) + v1.trim(23711, 23711) + v2.trim(23711, 0)
v2 = v2.trim(0, 23712) + v1.trim(23713, 23713) + v2.trim(23713, 0)
v2 = v2.trim(0, 23714) + v1.trim(23715, 23715) + v2.trim(23715, 0)
v2 = v2.trim(0, 23716) + v1.trim(23717, 23717) + v2.trim(23717, 0)
v2 = v2.trim(0, 23718) + v1.trim(23719, 23719) + v2.trim(23719, 0)
v2 = v2.trim(0, 23720) + v1.trim(23721, 23721) + v2.trim(23721, 0)
v2 = v2.trim(0, 23722) + v1.trim(23723, 23723) + v2.trim(23723, 0)
v2 = v2.trim(0, 23724) + v1.trim(23725, 23725) + v2.trim(23725, 0)
v2 = v2.trim(0, 23726) + v1.trim(23727, 23727) + v2.trim(23727, 0)
v2 = v2.trim(0, 23728) + v1.trim(23729, 23729) + v2.trim(23729, 0)
v2 = v2.trim(0, 23730) + v1.trim(23731, 23731) + v2.trim(23731, 0)
v2 = v2.trim(0, 23732) + v1.trim(23733, 23733) + v2.trim(23733, 0)
v2 = v2.trim(0, 23734) + v1.trim(23735, 23735) + v2.trim(23735, 0)
v2 = v2.trim(0, 23736) + v1.trim(23737, 23737) + v2.trim(23737, 0)
v2 = v2.trim(0, 23738) + v1.trim(23739, 23739) + v2.trim(23739, 0)
v2 = v2.trim(0, 23740) + v1.trim(23741, 23741) + v2.trim(23741, 0)
v2 = v2.trim(0, 23742) + v1.trim(23743, 23743) + v2.trim(23743, 0)
v2 = v2.trim(0, 23744) + v1.trim(23745, 23745) + v2.trim(23745, 0)
v2 = v2.trim(0, 23746) + v1.trim(23747, 23747) + v2.trim(23747, 0)
v2 = v2.trim(0, 23748) + v1.trim(23749, 23749) + v2.trim(23749, 0)
v2 = v2.trim(0, 23750) + v1.trim(23751, 23751) + v2.trim(23751, 0)
v2 = v2.trim(0, 23752) + v1.trim(23753, 23753) + v2.trim(23753, 0)
v2 = v2.trim(0, 23755) + v1.trim(23756, 23756) + v2.trim(23756, 0)

#v1 = v1.trim(0, 24819) + v2.trim(24820, 24846) + v1.trim(24823, 0)
v1 = v1.trim(0, 24819) + v2.trim(24820, 24827) + v1.trim(24823, 0)

v1 = v1.trim(0, 24828) + v2.trim(24829, 24830) + v1.trim(24829, 0)
v1 = v1.trim(0, 24831) + v2.trim(24832, 24833) + v1.trim(24832, 0)
v1 = v1.trim(0, 24834) + v2.trim(24835, 24836) + v1.trim(24835, 0)
v1 = v1.trim(0, 24837) + v2.trim(24838, 24839) + v1.trim(24838, 0)
v1 = v1.trim(0, 24840) + v2.trim(24841, 24842) + v1.trim(24841, 0)
v1 = v1.trim(0, 24843) + v2.trim(24844, 24844) + v1.trim(24844, 0)
v1 = v1.trim(0, 24845) + v2.trim(24846, 24846) + v1.trim(24846, 0)
v1 = v1.trim(0, 24847) + v2.trim(24848, 24848) + v1.trim(24848, 0)
v1 = v1.trim(0, 24849) + v2.trim(24850, 24850) + v1.trim(24850, 0)
v1 = v1.trim(0, 24851) + v2.trim(24852, 24852) + v1.trim(24852, 0)
v1 = v1.trim(0, 24853) + v2.trim(24854, 24854) + v1.trim(24854, 0)
v1 = v1.trim(0, 24855) + v2.trim(24856, 24856) + v1.trim(24856, 0)
v1 = v1.trim(0, 24857) + v2.trim(24858, 24858) + v1.trim(24858, 0)
v1 = v1.trim(0, 24859) + v2.trim(24860, 24860) + v1.trim(24860, 0)

last = v1.interleave(v2).histogram("levels")
#last = v1.stackHorizontal(v2)
prefetch