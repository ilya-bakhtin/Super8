LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v73 = LSMASHVideoSource(dst_dir + "v73rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v73f.mp4")
v73 = ImageSource(file = dst_dir + "v73-png\v73-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v73 = v73.convertToY.adjustSize

#v73 = v73.extractY.convertToYV12(interlaced=false)
#v73 = v73.deScratch.extractY

v73 = v73.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v73 = v73.convertBits(8).convertToYV12(interlaced=false)

v73 = v73.deScratch.extractY
v73 = v73.removeDirt
v73 = v73.convertToYV12(interlaced=false)
v73 = v73.UnsharpMask(strength=400, radius=5, threshold=1)
v73 = v73.adjustBorders
#v73 = v73.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v73 = v73.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

return v73.Prefetch

