import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v67 = LSMASHVideoSource(dst_dir + "v67rc.mp4")

v67 = v67.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v67 = v67.convertToYV12(interlaced=false)

v67 = v67.UnsharpMask(strength=500, radius=5, threshold=1)
v67 = v67.adjustBorders

va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

return v67.Prefetch

