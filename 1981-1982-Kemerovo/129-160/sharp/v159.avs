import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v159 = LSMASHVideoSource(dst_dir + "v159rc.mp4")

v159 = v159.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v159 = v159.convertToYV12(interlaced=false)

v159 = v159.UnsharpMask(strength=500, radius=5, threshold=1)
v159 = v159.adjustBorders

va = BlankClip(v159, audio_rate = 48000, channels = 2).killVideo
v159 = v159.audioDub(va)

return v159.Prefetch

