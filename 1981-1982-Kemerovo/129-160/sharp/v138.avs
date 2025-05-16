import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v138 = LSMASHVideoSource(dst_dir + "v138rc.mp4")

v138 = v138.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v138 = v138.convertToYV12(interlaced=false)

v138 = v138.UnsharpMask(strength=500, radius=5, threshold=1)
v138 = v138.adjustBorders

va = BlankClip(v138, audio_rate = 48000, channels = 2).killVideo
v138 = v138.audioDub(va)

return v138.Prefetch

