LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v60 = LSMASHVideoSource(dst_dir + "v60rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v60f.mp4")
v60 = ImageSource(file = dst_dir + "v60-png\v60-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v60 = v60.convertToY.adjustSize

#v60 = v60.extractY.convertToYV12(interlaced=false)
#v60 = v60.deScratch.extractY

v60 = v60.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v60 = v60.convertBits(8).convertToYV12(interlaced=false)

v60 = v60.deScratch.extractY
v60 = v60.removeDirt
v60 = v60.convertToYV12(interlaced=false)
v60 = v60.UnsharpMask(strength=400, radius=5, threshold=1)
v60 = v60.adjustBorders
#v60 = v60.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v60 = v60.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v60, audio_rate = 48000, channels = 2).killVideo
v60 = v60.audioDub(va)

return v60.Prefetch

