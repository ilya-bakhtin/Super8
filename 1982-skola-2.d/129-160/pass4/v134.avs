LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v134 = LSMASHVideoSource(dst_dir + "v134rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v134f.mp4")
v134 = ImageSource(file = dst_dir + "v134-png\v134-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v134 = v134.convertToY.adjustSize

#v134 = v134.extractY.convertToYV12(interlaced=false)
#v134 = v134.deScratch.extractY

v134 = v134.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v134 = v134.convertBits(8).convertToYV12(interlaced=false)

v134 = v134.deScratch.extractY
v134 = v134.removeDirt
v134 = v134.convertToYV12(interlaced=false)
v134 = v134.UnsharpMask(strength=400, radius=5, threshold=1)
v134 = v134.adjustBorders
#v134 = v134.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v134 = v134.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v134, audio_rate = 48000, channels = 2).killVideo
v134 = v134.audioDub(va)

return v134.Prefetch

