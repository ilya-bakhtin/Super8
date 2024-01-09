import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103.audioDub(va)

last = v103
prefetch

