LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v107 = LSMASHVideoSource(dst_dir + "v107rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v107f.mp4")
v107 = ImageSource(file = dst_dir + "v107-png\v107-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v107 = v107.convertToY.adjustSize

#v107 = v107.extractY.convertToYV12(interlaced=false)
#v107 = v107.deScratch.extractY

v107 = v107.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v107 = v107.convertBits(8).convertToYV12(interlaced=false)

v107 = v107.deScratch.extractY
v107 = v107.removeDirt
v107 = v107.convertToYV12(interlaced=false)
v107 = v107.UnsharpMask(strength=400, radius=5, threshold=1)
v107 = v107.adjustBorders
#v107 = v107.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v107 = v107.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v107, audio_rate = 48000, channels = 2).killVideo
v107 = v107.audioDub(va)

return v107.Prefetch

