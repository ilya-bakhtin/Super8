import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v377 = LSMASHVideoSource(dst_dir + "v377rc.mp4")

v377 = v377.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v377 = v377.convertToYV12(interlaced=false)

v377 = v377.UnsharpMask(strength=500, radius=5, threshold=1)
v377 = v377.adjustBorders

va = BlankClip(v377, audio_rate = 48000, channels = 2).killVideo
v377 = v377.audioDub(va)

return v377.Prefetch

