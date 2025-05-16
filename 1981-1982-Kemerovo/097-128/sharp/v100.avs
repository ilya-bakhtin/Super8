import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v100 = LSMASHVideoSource(dst_dir + "v100rc.mp4")

v100 = v100.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v100 = v100.convertToYV12(interlaced=false)

v100 = v100.UnsharpMask(strength=500, radius=5, threshold=1)
v100 = v100.adjustBorders

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

return v100.Prefetch

