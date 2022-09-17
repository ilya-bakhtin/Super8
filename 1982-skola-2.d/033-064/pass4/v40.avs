LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v40 = LSMASHVideoSource(dst_dir + "v40rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v40f.mp4")
v40 = ImageSource(file = dst_dir + "v40-png\v40-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v40 = v40.convertToY.adjustSize

#v40 = v40.extractY.convertToYV12(interlaced=false)
#v40 = v40.deScratch.extractY

v40 = v40.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v40 = v40.convertBits(8).convertToYV12(interlaced=false)

v40 = v40.deScratch.extractY
v40 = v40.removeDirt
v40 = v40.convertToYV12(interlaced=false)
v40 = v40.UnsharpMask(strength=500, radius=7, threshold=1)
v40 = v40.adjustBorders
#v40 = v40.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v40 = v40.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

return v40.Prefetch

