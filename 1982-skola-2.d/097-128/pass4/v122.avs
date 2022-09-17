LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v122 = LSMASHVideoSource(dst_dir + "v122rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v122f.mp4")
v122 = ImageSource(file = dst_dir + "v122-png\v122-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v122 = v122.convertToY.adjustSize

#v122 = v122.extractY.convertToYV12(interlaced=false)
#v122 = v122.deScratch.extractY

v122 = v122.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v122 = v122.convertBits(8).convertToYV12(interlaced=false)

v122 = v122.deScratch.extractY
v122 = v122.removeDirt
v122 = v122.convertToYV12(interlaced=false)
v122 = v122.UnsharpMask(strength=400, radius=5, threshold=1)
v122 = v122.adjustBorders
#v122 = v122.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v122 = v122.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo
v122 = v122.audioDub(va)

return v122.Prefetch

