LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v179 = LSMASHVideoSource(dst_dir + "v179rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v179f.mp4")
v179 = ImageSource(file = dst_dir + "v179-png\v179-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v179 = v179.convertToY.adjustSize

#v179 = v179.extractY.convertToYV12(interlaced=false)
#v179 = v179.deScratch.extractY

v179 = v179.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v179 = v179.convertBits(8).convertToYV12(interlaced=false)

v179 = v179.deScratch.extractY
v179 = v179.removeDirt
v179 = v179.convertToYV12(interlaced=false)
v179 = v179.UnsharpMask(strength=400, radius=5, threshold=1)
v179 = v179.adjustBorders
#v179 = v179.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v179 = v179.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v179, audio_rate = 48000, channels = 2).killVideo
v179 = v179.audioDub(va)

return v179.Prefetch

