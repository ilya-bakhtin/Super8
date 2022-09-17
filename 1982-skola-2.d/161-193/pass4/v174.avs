LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v174 = LSMASHVideoSource(dst_dir + "v174rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v174f.mp4")
v174 = ImageSource(file = dst_dir + "v174-png\v174-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v174 = v174.convertToY.adjustSize

#v174 = v174.extractY.convertToYV12(interlaced=false)
#v174 = v174.deScratch.extractY

v174 = v174.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v174 = v174.convertBits(8).convertToYV12(interlaced=false)

v174 = v174.deScratch.extractY
v174 = v174.removeDirt
v174 = v174.convertToYV12(interlaced=false)
v174 = v174.UnsharpMask(strength=400, radius=5, threshold=1)
v174 = v174.adjustBorders
#v174 = v174.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v174 = v174.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v174, audio_rate = 48000, channels = 2).killVideo
v174 = v174.audioDub(va)

return v174.Prefetch

